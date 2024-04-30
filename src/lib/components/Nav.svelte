
<script>
  export let active = '';
</script>

<nav class="flex justify-between items-center p-4 bg-white shadow-md">
  <img src="/images/logo.png" alt="POSE Logo" class="h-8" />
  <div class="flex space-x-4">
    <a href="/" class={active === 'home' ? 'active' : ''}>Home</a>
    <a href="/communities" class={active === 'communities' ? 'active' : ''}>Your Communities</a>
    <a href="/about" class={active === 'about' ? 'active' : ''}>Who we are</a>
    <a href="/facts" class={active === 'profile' ? 'active' : ''}>Fact House</a>
    <a href="/chats" class={active === 'diagnoses' ? 'active' : ''}>Your Chats</a>
  </div>
</nav>

<style>
  nav a {
    text-decoration: none;
    color: #333;
    padding: 0.5em 1em;
  }
  .active {
    color: #007bff;
    border-bottom: 2px solid #007bff;
  }
</style>
    