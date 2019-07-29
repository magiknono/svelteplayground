<script>
	export let answer = 'mystery'; // default values for props 
</script>

<style>
	p {
		color: blue;
		font-family: 'Comic Sans MS';
		font-size: 2em;
	}
</style>

<p>This is a paragraph.</p>

<!-- In any real application, you'll need to pass data from one component down to its children. To do that, we need to declare properties, generally shortened to 'props'. In Svelte, we do that with the export keyword. --> 
<p>The answer is {answer}</p>
