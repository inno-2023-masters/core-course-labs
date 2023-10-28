<script lang="ts">
    export let iconSize : Number = 40;
    export let imgSrc : string;
    export let alt : string;
    export let href : string;
    export let id : string;
</script>

<a id={id} href={href}>
    <img src={imgSrc} class="icon" style="width:{iconSize}px; height:{iconSize}px;" alt={alt}>
</a>
