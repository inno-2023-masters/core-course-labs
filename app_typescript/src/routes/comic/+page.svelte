<script lang="ts">
    interface IComic {
      month: string;
      num: string;
      link: string;
      year: string;
      news: string;
      safe_title: string;
      transcript: string;
      alt: string;
      img: string;
      title: string;
      day: string;
    }

      const EMAIL = "s.khamrakulov@innopolis.university";
      const ID_BASE_URL = "https://fwd.innopolis.app/api/hw2";
      const COMIC_BASE_URL = "https://getxkcd.vercel.app/api/comic";

      const getID: () => Promise<number> = async () => {
        let res = await fetch(ID_BASE_URL + `?email=${EMAIL}`);
        let resBody: number = await res.json();
        return resBody;
      };

      const getComic: () => Promise<IComic> = async () => {
        let id = await getID();
        let res = await fetch(COMIC_BASE_URL + `?num=${id}`);
        let resBody: IComic = await res.json();
        return resBody;
      };
    </script>

    {#await getComic()}
      <p>Fetching the data !!</p>
    {:then comic}

      <section class="comic-area mt-4" id="comic-section">
        <div id="comic-container">
            <h1 class="text-center"><strong>Enjoy Some Random Comics:</strong></h1>
            <div id="title">{comic.title}</div>
            <div id="date">{new Date(
                              parseInt(comic.year),
                              parseInt(comic.month) - 1,
                              parseInt(comic.day)
                            ).toLocaleDateString()}
                          </div>
            <img id="img" src={comic.img} alt="{comic.alt}"/>

            <div id="alt">{comic.alt}</div>
        </div>
      </section>
    {:catch error}
      <p style="color: red">{error.message}</p>
    {/await}


    <style>
      /* Comic styles */

    /* Style the main container */
    #comic-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }


    /* Style the comic title */
    #title {
      font-size: 1.5rem;
      font-weight: bold;
      margin: 1rem 0;
    }

    /* Style the comic date */
    #date {
      font-size: 1rem;
      margin-bottom: 1rem;
    }

    /* Style the comic alt text */
    #alt {
      max-width: 600px;
      font-style: italic;
    }

    /* End Comic styles */
    </style>
