


<div class="text-center">
  <h1 class="text-4xl font-bold mb-4">~The Fact House~</h1>
 
  <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-full mb-4" id="aiFunctionButton">
    Do you thirst for knowledge? O_o
</button>

<!-- A div to display the response from the AI function -->
<div id="responseDisplay" style="margin-top: 10px; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></div>

<script>
    // Event handler function for the button click
    document.getElementById('aiFunctionButton').addEventListener('click', async () => {
        try {
            // Define the URL of the Google Cloud AI function
            const aiFunctionUrl = 'https://your-ai-function-url.cloudfunctions.net/yourFunctionName';

            // Make a POST request to the AI function
            const response = await fetch(aiFunctionUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    // Send data as necessary to the function
                    // Replace the contents with your data, if needed
                    key1: 'value1',
                    key2: 'value2'
                })
            });

            // Handle the response
            if (response.ok) {
                const data = await response.text(); // Read the response as plain text
                // Display the response in the div
                document.getElementById('responseDisplay').innerText = data;
            } else {
                // Display an error message
                document.getElementById('responseDisplay').innerText = `Failed to call AI function: ${response.status} - ${response.statusText}`;
            }
        } catch (error) {
            // Display an error message
            document.getElementById('responseDisplay').innerText = `Error: ${error}`;
        }
    });
  </script>

  
</div>
    