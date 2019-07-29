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
  
  // Logic
  let user = { loggedIn: false };

	function toggle() {
		user.loggedIn = !user.loggedIn;
  }
  
  let x = 7;

  let cats = [
		{ id: 'J---aiyznGQ', name: 'Keyboard Cat' },
		{ id: 'z_AbfPXTKms', name: 'Maru' },
		{ id: 'OUtn3pvWmpg', name: 'Henri The Existential Cat' }
  ];
  
  // import Thing from './Thing.svelte';

	// let things = [
	// 	{ id: 1, value: 'a' },
	// 	{ id: 2, value: 'b' },
	// 	{ id: 3, value: 'c' },
	// 	{ id: 4, value: 'd' },
	// 	{ id: 5, value: 'e' }
	// ];

	// function handleClick() {
	// 	things = things.slice(1);
	// }
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
    <hr />
    <p>Logic</p>
    <cite>A # character always indicates a block opening tag. A / character always indicates a block closing tag. A : character, as in :else, indicates a block continuation tag.</cite>
    <p>
      {#if user.loggedIn}
        <button on:click={toggle}>
          Log out
        </button>
      {:else}
        <button on:click={toggle}>
          Log in
        </button>
      {/if}
    </p>
    {#if x > 10}
      <p>{x} is greater than 10</p>
    {:else if 5 > x}
      <p>{x} is less than 5</p>
    {:else}
      <p>{x} is between 5 and 10</p>
    {/if}
    <h1>The Famous Cats of YouTube</h1>
    <ul>
      {#each cats as cat}
        <li><a target="_blank" href="https://www.youtube.com/watch?v={cat.id}">
          {cat.name}
        </a></li>
      {/each}
    </ul>
     <ul>
     <!-- with index -->
      {#each cats as cat, i}
        <li><a target="_blank" href="https://www.youtube.com/watch?v={cat.id}">
          {i + 1}: {cat.name}
        </a></li>
      {/each}
    </ul>
    <ul>
      <!-- destructuring -->
      {#each cats as { id, name }}
        <li><a target="_blank" href="https://www.youtube.com/watch?v={id}">
          {name}
        </a></li>
      {/each}
    </ul>
    <hr />
    <!-- <button on:click={handleClick}>
      Remove first thing
    </button>

    {#each things as thing (thing.id)}
      <Thing value={thing.value}/>
    {/each} -->
 </article>
</section>