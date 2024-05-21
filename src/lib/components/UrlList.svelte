<script lang="ts">
    import { urlStore, removeUrl, Url } from '../stores/UrlStore';
    import { get } from 'svelte/store';
  
    let urls: Url[] = [];
  
    urlStore.subscribe(value => {
      urls = value;
    });

    function handleRemove(id: number) {
    removeUrl(id);
   }
  </script>
  
  <ul>
    {#each urls as { id, url }}
      <li key={id} class="url-item">
        <a href={url} target="_blank" rel="noopener noreferrer">{url}</a>
        <button class="delete-btn" on:click={() => handleRemove(id)}>X</button>
    </li>
    {/each}
  </ul>

  <style>
    .url-item {
      display: flex;
      align-items: center;
      margin-bottom: 0.5rem;
    }
  
    .url-item a {
      flex-grow: 1;
      text-decoration: none;
      color: blue;
    }
  
    .delete-btn {
      margin-left: 1rem;
      background-color: red;
      color: white;
      border: none;
      padding: 0.2rem 0.5rem;
      cursor: pointer;
    }
  </style>
  