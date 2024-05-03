<script>
  import { page } from '$app/stores';

  // Define the active state to keep track of the active tab
  let active = '';

  // Reactive statement to update the active state based on the current route
  $: {
      // Access the current path from the $page store
      const currentPath = $page.url && $page.url.pathname; // Safe access to avoid null or undefined errors

      // Determine the active state based on the current path
      if (currentPath === '/') {
          active = 'home';
      } else if (currentPath === '/communities') {
          active = 'communities';
      } else if (currentPath === '/about') {
          active = 'about';
      } else if (currentPath === '/facts') {
          active = 'facts';
      } else if (currentPath === '/chats') {
          active = 'chats';
      } else {
          active = ''; // No active state for unknown paths
      }
  }
</script>

<nav class="flex justify-between items-center p-4 bg-white shadow-md">
  <div class="flex space-x-4">
      <a href="/" class={active === 'home' ? 'active' : ''}>Home</a>
      <a href="/communities" class={active === 'communities' ? 'active' : ''}>Your Communities</a>
      <a href="/about" class={active === 'about' ? 'active' : ''}>Who We Are</a>
      <a href="/facts" class={active === 'facts' ? 'active' : ''}>Fact House</a>
      <a href="/chats" class={active === 'chats' ? 'active' : ''}>Your Chats</a>
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
