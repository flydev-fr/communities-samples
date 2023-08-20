<template>
  <div>
    <h1>{{ msg }}</h1>

    <p class="my-2">
      <a href="https://vitejs.dev/guide/features.html" target="_blank"
        >Vite Documentation</a
      >
      |
      <a href="https://vuejs.org/v2/guide/" target="_blank"
        >Vue 2 Documentation</a
      >
    </p>

    <button
      class="
        px-4
        py-2
        font-semibold
        text-sm
        bg-green-500
        text-white
        rounded-full
        shadow-sm
      "
      @click="count++"
    >
      count is: {{ count }}
    </button>
  </div>
</template>

<script>
export default {
  props: {
    msg: String,
  },
  data() {
    return {
      count: 0,
    };
  },
};
</script>

<style scoped>
a {
  color: #42b983;
}
</style>
