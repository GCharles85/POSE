
<script>
  export let active = '';
</script>

<nav class="flex justify-between items-center p-4 bg-white shadow-md">
  <img src="/static/images/logo.png" alt="POSE Logo" class="h-8" />
  <div class="flex space-x-4">
    <a href="/" class={active === 'home' ? 'active' : ''}>Your Subscription</a>
    <a href="/communities" class={active === 'communities' ? 'active' : ''}>Your Communities</a>
    <a href="/about" class={active === 'about' ? 'active' : ''}>Who we are</a>
    <a href="/profile" class={active === 'profile' ? 'active' : ''}>Your profile</a>
    <a href="/routes/diagnoses" class={active === 'diagnoses' ? 'active' : ''}>Your Diagnoses</a>
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
    