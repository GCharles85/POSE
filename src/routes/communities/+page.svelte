

<script lang="ts">
  //import CommunitySection from '$lib/components/CommunitySection.svelte';
  //import request  from 'request-promise-native'; // Assuming 'request-promise-native' is imported
  //import { HTMLProps, HTMLAttributes } from 'svelte';

  


  let searchTerm = '';
  //: { src: string; alt: string }[] 
  let images = [
  { src: "./../../../carparts.png", alt: "Random images 1" }, // Add a comma here
  { src: "./../../../carparts.png", alt: "Random images 2" },
  { src: "./../../../forum.png", alt: "Random images 3" },
  { src: "./../../../forum.png", alt: "Random images 4" }
];


  async function handleSearch() {
  //   if (searchTerm === '') return;

  //   const encodedTerm = encodeURIComponent(searchTerm);

  //   // Consider storing your API key securely (e.g., environment variables)
  //   const apiKey = 'TMTN3VQ57O56BS1F8HVITBGL6HZSGZLSF5LLZ1BF107TKQB257SRKIQIJLO6K978VBKE8BZ6FDMT54N2'; // Replace with your actual key (avoid hardcoding)

  //   const options = {
  //     uri: 'https://app.scrapingbee.com/api/v1/',
  //     qs: {
  //       'api_key': apiKey,
  //       'url': 'https://demo.scrapingbee.com/images.html', // Update URL with search term
  //       'extract_rules': '{"images": {"selector": ".some-result-class img", "type": "list", "output": {"src": "img@src", "alt": "img@alt"}}}', // Adjust selectors and output based on carparts.com structure (remember CORS)
  //     },
  //     method: 'GET',
  //   };

  //   try {
  //     const response = await request(options);
  //     const data = await response.json();

  //     if (!response.ok) {
  //       console.error('Error fetching results:', response.statusText);
  //       return;
  //     }

  //     try {
  //       // Extract images using provided extract rules (if available)
  //       if (data?.extract_rules?.images) {
  //         images = data.results.map(result => ({
  //           src: result[data.extract_rules.images.output.src], // Access src using selector
  //           alt: result[data.extract_rules.images.output.alt], // Access alt using selector
  //         }));
  //       } else {
  //         console.warn('Scraping directly might be blocked by CORS. Consider alternative approaches.');
  //         // Hypothetical extraction (might not work due to CORS)
  //         // Replace with selectors that match carparts.com's structure (if possible)
  //         images = data.images.map(image => ({
  //           src: image.src, // Assuming direct access to "src" property
  //           alt: image.alt || 'Image', // Provide default alt text if not available
  //         }));
  //       }
  //     } catch (error) {
  //       console.error('Error extracting images:', error);
  //     }
  //   } catch (error) {
  //     console.error('Error fetching data:', error);
  //   }
   }
</script>

<body>
  <!--<input type="text" bind:value={searchTerm} on:keyup.enter={handleSearch} placeholder="Search for car mechanic shops or parts...">

  <button on:click={handleSearch}>SEARCH</button> -->

  <h2>Images</h2>
  <ul>
    {#each images as image}
      <li>
        <img src="{image.src}" alt="{image.alt}" width="200" height="300">
      </li>
    {/each}
  </ul>
</body>
