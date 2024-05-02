<script>
  import { page } from '$app/stores';

  // Define the current active tab state
  let active = '';

  // Function to handle clicks on anchor tags
  function handleClick(path) {
      active = path; // Update the active state based on the clicked path
  }

  // Use the page store to get the current path and set the initial active state
  $: active = page.url.pathname;
  
</script>

<nav class="flex justify-between items-center p-4 bg-white shadow-md">
  <div class="flex space-x-4">
      <a href="/" class={active === '/' ? 'active' : ''} on:click={() => handleClick('/')}>Home</a>
      <a href="/communities" class={active === '/communities' ? 'active' : ''} on:click={() => handleClick('/communities')}>Your Communities</a>
      <a href="/about" class={active === '/about' ? 'active' : ''} on:click={() => handleClick('/about')}>Who We Are</a>
      <a href="/facts" class={active === '/facts' ? 'active' : ''} on:click={() => handleClick('/facts')}>Fact House</a>
      <a href="/chats" class={active === '/chats' ? 'active' : ''} on:click={() => handleClick('/chats')}>Your Chats</a>
  </div>
</nav>

<style>
  /* Style for links in the nav bar */
  nav a {
      text-decoration: none;
      color: #333;
      padding: 0.5em 1em;
  }

  /* Style for active links */
  .active {
      color: #007bff;
      border-bottom: 2px solid #007bff;
  }
</style>
