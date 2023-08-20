import App from './App.svelte';

const app = new App({
	target: document.body,
	props: {
		name: 'Fable',
		msg: 'F# into the JavaScript'
	}
});

export default app;