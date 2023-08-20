<template>
  <div id="app" class="text-center flex flex-col h-screen align-items-center justify-between py-10">
    <div>
      <h1 class="my-5 font-extrabold text-5xl bg-clip-text text-transparent bg-gradient-to-r from-green-500 via-green-500 to-green-50 mb-10">Vue 2</h1>
      <img src="https://vuejs.org/images/logo.png" alt="vue logo" class="mx-auto w-40" />
    </div>

    <div class="my-10 py-10 mx-16">
      <p class="text-3xl font-mono">
        <span class="bg-clip-text text-transparent bg-gradient-to-r from-blue-300 via-blue-400 to-blue-600 italic">Styled with</span> <span class="font-extrabold bg-clip-text text-transparent bg-gradient-to-r from-blue-500 to-blue-600">TailwindCSS</span> 🎨
      </p>
      <p class="text-3xl my-3 text-gray-400 font-mono">&amp;</p>
      <p class="text-3xl font-mono">
        <span class="bg-clip-text text-transparent bg-gradient-to-r from-pink-500 via-red-500 to-yellow-500 italic">Bundled with</span> <span class="font-extrabold bg-clip-text text-transparent bg-gradient-to-r from-indigo-400 to-yellow-400 ">Vite</span> ⚡
      </p>
    </div>

    <div class="my-10 py-10 mx-16 shadow-xl rounded-xl">
        <HelloWorld />
    </div>

    <p class="py-10"> 
      <img src="https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon.png?v=c78bd457575a" alt="stackoverlow logo" class="w-16 inline" />
      <a href="https://stackoverflow.com/q/70685948/774432" target="_blank" class="font-mono">stackoverflow.com/flydev</a></p>
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue';

export default {
  components: {
    HelloWorld
  }
}
</script>

<style>
body {
  background: linear-gradient(to right, #ffffff, #ece9e6);
}
</style>
