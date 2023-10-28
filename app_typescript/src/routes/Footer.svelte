<script lang="ts">
    import Contacts from "./Contacts.svelte";

</script>

<div style="display:inline; ">
    <div class="foot">
        <Contacts/>
    </div>
    <p class="name-icon">
        ©2023 Shohjahon
    </p>
</div>

<style>
    .foot{
        display: flex;
        margin-top: 50px;
        margin-left: auto;
        margin-right: auto;
        justify-content:center;
    }

    .name-icon{
        display: flex;
        margin-left: auto;
        margin-right: auto;
        justify-content: center;
    }

</style>
