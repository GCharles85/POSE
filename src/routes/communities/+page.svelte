
<script>
  import { onMount } from 'svelte';
  let searchTerm = '';
  let results = [];

  async function handleSearch() {
      if (searchTerm === '') return;

      const encodedTerm = encodeURIComponent(searchTerm);
  
      // Construct the Google search URL
      const url = `https://www.google.com/search?q=${encodedTerm}`;

      const response = await fetch(url);
      const html = await response.text();
      
      const parser = new DOMParser();
      const doc = parser.parseFromString(html, 'text/html');
      
      // **Limited Scope Example**: This is a very basic example that looks for snippets within title tags
      const titles = doc.querySelectorAll('title');
      const snippets = Array.from(titles).map(title => title.textContent);

      const results = [];
  

      for (const snippet of snippets) {
        const textContent = snippet.textContent.trim();
        if (textContent) { // Avoid empty text content
          results.push({
            title: snippet.tagName, // Use element tag name as a basic title
            content: textContent
          });
        }
      }
  }
</script>

<svelte:head>
  <title>Pose - Find a Mechanic</title>
</svelte:head>

<body>
  <main>
    <input type="text" bind:value={searchTerm} on:keyup.enter={handleSearch} placeholder="Search for car mechanic shops or parts...">
    <button on:click={handleSearch}>SEARCH</button>
      <div>
          <h2>Results</h2>
          <ul>
              {#each results as result}
                  <li>{result}</li>
              {/each}
          </ul>
      </div>
  </main>
</body>


   