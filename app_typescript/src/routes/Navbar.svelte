<script lang="ts">
    import Contacts from './Contacts.svelte';
    import {base} from "$app/paths"
    import {page} from "$app/stores"

    $: pageId = $page.route.id;

</script>

<header>
    <div class="nav-links">
        <a class="nav-link" href="{base}/" class:active={pageId==='/'}>Portfolio</a>
        <a class="nav-link" href="{base}/comic" class:active={pageId==='/comic'}>Comic</a>
    </div>
    <nav class="nav-bar">

        <Contacts/>
    </nav>
</header>


<style>
    header {
        background-color: #333;
        color: #fff;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
    }

    .nav-links{
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
    }

    .nav-link{
        display: block;
        padding: 0.5rem 1rem;
        margin: auto 0.5rem;
        text-decoration: none;
        color: rgb(25, 76, 169);
        border-radius: 5px;
        background-color: rgb(255, 255, 255);
        font-weight: bold;
        border: 1px solid rgb(192, 192, 192);
    }
    .active{
        background-color: rgb(25, 76, 169);
        color: white;
        border: 1px solid rgb(25, 76, 169);
    }

    .nav-bar{
        display: flex;
        flex-direction: row;
        height: 70px;
        align-items: center;
        justify-content: space-between;
    }

</style>
