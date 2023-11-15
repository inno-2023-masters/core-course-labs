<script>
  let date= new Date();
  $: time = date.toLocaleTimeString();
</script>

<main>
  <h1>Moscow Time</h1>
  <h3>
    Current time in Moscow is {time}
  </h3>
</main>

