<script>
  import Nested from './Nested.svelte';
  export let name;
  export let src = 'images/svelte-logo.svg';
  let string = `this string contains some <strong>HTML!!!</strong>`;
  let count = 1;
  let numbers = [1, 2, 3, 4];
  $: sum = numbers.reduce((t, n) => t + n, 0);
  // the `$:` means 're-run whenever these values change'
  // reactive declarations
	$: doubled = count * 2;
  $: quadrupled = doubled * 2;

  $: {
  console.log(`the count is ${count}`);
  console.log(`hello ${name}`);
  }

  $: if (count >= 10) {
	alert(`count is dangerously high!`);
	count = 9;
  }
  
	function handleClick() {
		count += 1;
  }
  function addNumber() {
	numbers = [...numbers, numbers.length + 1];
}
// Assignments to properties of arrays and objects
//   function addNumber() {
// 	numbers[numbers.length] = numbers.length + 1;
// }

	import Info from './Info.svelte';

	const pkg = {
		name: 'svelte',
		version: 3,
		speed: 'blazing',
		website: 'https://svelte.dev'
	};
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
    <hr />
    <p>Reactivity</p>
    <button on:click={handleClick}>
      Clicked {count} {count === 1 ? 'time' : 'times'}
    </button>

    <p>{count} * 2 = {doubled}</p>
    <p>{doubled} * 2 = {quadrupled}</p>
    <hr />
    <p>Updating arrays</p>
    <p>{numbers.join(' + ')} = {sum}</p>
    <button on:click={addNumber}>
      Add a number
    </button>
    <hr />
    <p><Nested answer={42}/></p>
    <hr />
    <p>Spread props</p>
    <Info name={pkg.name} version={pkg.version} speed={pkg.speed} website={pkg.website}/>
    <cite>If you have an object of properties, you can 'spread' them on to a component instead of specifying each one:</cite>
    <Info {...pkg}/>
 </article>
</section>