<!--
//Button to create new instances




-->

<script context="module">
  import { exec } from 'child_process';
  
  // Server-side function to create a new AI instance
  export async function createAIInstance() {
      // Path to the Bash script
      const scriptPath = './create_ai_instance.sh';
  
      return new Promise((resolve, reject) => {
          exec(scriptPath, (error, stdout, stderr) => {
              if (error) {
                  console.error(`Error creating AI instance: ${error.message}`);
                  reject(error.message);
              } else {
                  console.log(`AI instance creation output: ${stdout}`);
                  console.error(`stderr: ${stderr}`);
                  resolve(stdout);
              }
          });
      });
  }
  </script>
  
  <script>
  // Handle the button click event
  async function handleButtonClick() {
      try {
          const result = await createAIInstance();
          console.log('AI instance created successfully:', result);
          // Display the response to the user
          document.getElementById('responseDisplay').innerText = `Chat created successfully: ${result}`;
      } catch (error) {
          console.error('Error creating AI instance:', error);
          // Display the error message to the user
          document.getElementById('responseDisplay').innerText = `Error creating chata: ${error}`;
      }
  }
  </script>
  
  <template>
      <!-- Button that calls the server-side function when clicked -->
      <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-full mb-4" on:click={handleButtonClick}>
        Would you like to reinforce a new habit?
      </button>
  
      <!-- A div to display the response from the AI function -->
      <div id="responseDisplay" style="margin-top: 10px; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></div>
  </template>
  



<!-- <script>
  import DiagnosisItem from '$lib/components/DiagnosisItem.svelte';

  let diagnoses = [
    { diagnosis: 'Brakes', cost: '500', id: '0' },
    { diagnosis: 'Software and engine', cost: '600', id: '00' },
    { diagnosis: 'Transmission', cost: '100', id: '000' },
  ];
</script>

<div class="space-y-4">
  {#each diagnoses as diagnosis (diagnosis.id)}
    <DiagnosisItem {diagnosis}  />
  {/each}
</div> -->
    