<script lang="ts">
	import { onMount } from 'svelte'
	    
	export let name: string
	export let msg: string

    onMount(() => {
		import("./App.fs.js")
	})
</script>

<main>
	<h1>👋 Hello {name}!</h1>
	<p>Visit the <a href="https://svelte.dev/tutorial">Svelte tutorial</a> to learn how to build Svelte apps.</p>
		
	<div class="fable">
		<p>{msg}</p>
		<button class="my-button">Click me 👊</button>    
	</div>
</main>

<style>
	main {
		text-align: center;
		padding: 1em;
		max-width: 240px;
		margin: 0 auto;
	}

	h1 {
		color: #ff3e00;
		text-transform: uppercase;
		font-size: 4em;
		font-weight: 100;
	}
	
	.fable {
		margin-top: 3rem;
	}
	.fable button {
		border-radius: .8rem;
	} 

	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>