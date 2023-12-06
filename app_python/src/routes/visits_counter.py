from fastapi import APIRouter

router = APIRouter()

VISITS_PATH = "visit_volume/visits"

def get_visit_count():
    try:
        with open(VISITS_PATH, "r") as file:
            return int(file.read())
    except FileNotFoundError:
        return 0

def increment_visit_count():
    count = get_visit_count()
    with open(VISITS_PATH, "w") as file:
        file.write(str(count + 1))

@router.get("/visits")
async def visits():
    return {"resullt": get_visit_count()}