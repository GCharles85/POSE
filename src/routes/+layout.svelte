<script>
  import Nav from '$lib/components/Nav.svelte';
  import '../styles/app.css';

  export const ssr = false;
  export const prerender = true;

</script>

<Nav active="home" />
<div class="container mx-auto p-4">
  <slot />
</div>

