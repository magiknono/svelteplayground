<script>
  import Nested from './Nested.svelte';
  export let name;
  export let src = 'images/svelte-logo.svg';
  let string = `this string contains some <strong>HTML!!!</strong>`;

  	let count = 1;

	// the `$:` means 're-run whenever these values change'
	$: doubled = count * 2;
	$: quadrupled = doubled * 2;

	function handleClick() {
		count += 1;
	}
</script>

<style>
  h1 {
    color: purple;
  }
  p {
    color:red;
  }
</style>

<section class="row">
  <article class="column">

    <h1>Hello {name.toUpperCase()}!</h1>
    <img src={src} alt="svelte logo" />
    <p>Hello</p>
    <Nested/>
    <p>{@html string}</p>
    <button on:click={handleClick}>
      Count: {count}
    </button>

    <p>{count} * 2 = {doubled}</p>
    <p>{doubled} * 2 = {quadrupled}</p>

 </article>
</section>