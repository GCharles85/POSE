
<!--TODO
- change button & paragraph style to something rounder and green


-->
<script lang="ts">

  // Import the sentiment analysis module
  import sentiment from 'sentiment';

   // cloud function url imported from env variables 
  import PUBLIC_FUNCTION_URL from './../../config.json';
  import TextareaComponent from './../../lib/textarea-component.svelte';

  let inputText = "";
  let outputText = "";

  // loading state indication 
  let loadingState = false;

  // variable for reading .txt files
  let file = null;

  let analysisResult = null;

  // function to send HTTP request cloud function and receive summary 

  // Function to summarize text and perform sentiment analysis
async function summarizeText()
{
    // Set loading state to true
    loadingState = true;

    // Check if inputText is empty or only contains whitespace
    if (inputText.trim() === '') {
        // Set outputText with a message asking for an actual message
        outputText = 'Please give Mindy an actual message!';
        analysisResult = null; // Set analysisResult to null

        // Reset loading state
        loadingState = false;

        // Return early
        return;
    }

    try {
        // Send HTTP POST request to the cloud function
        const response = await fetch(PUBLIC_FUNCTION_URL.PUBLIC_FUNCTION_URL, {
            method: 'POST',
            body: JSON.stringify({ text: inputText }), // Adjusted to use JSON object
            headers: {
                'Content-Type': 'application/json'
            }
        });
        console.log('HTTP Status:', response.status);

        //Handle non-2xx status codes as errors
         if (!response.ok) {
             throw new Error('Failed to fetch summary');
         }

        // Get the response text
        outputText = await response.text();

        // Perform sentiment analysis on the output text
        const sentimentAnalyzer = new sentiment();
        analysisResult = sentimentAnalyzer.analyze(outputText);
    } catch (error) {
        // Handle errors gracefully
        console.error('Error:', error);
        //outputText = 'An error occurred while processing the request.';
        //analysisResult = null; // Reset analysisResult in case of error
    } finally {
        // Reset loading state
        loadingState = false;
    }
}

  // function for reading .txt files and storing it in variable 
  async function fileUpload() {
    if (file !== null && file.files !== null) {
      // inputText = await file.files[0].text();
      inputText = await file.files[0].text();
    }
  }
</script>

<!-- head  -->
<svelte:head>
  <title>Your Chats</title>
</svelte:head>

<div class="bg-gray-100 min-h-screen">
  <!-- navbar  -->
  <div
    class="flex flex-row items-center space-x-4 bg-blue-600 text-white p-4 shadow-lg font-bold text-3xl mb-4 lg:mb-16"
    style="font-family: 'Lobster', cursive;"
  >
    <!-- google cloud logo  
    <img
      class="w-8 h-8"
      src="https://www.gend.co/hs-fs/hubfs/gcp-logo-cloud.png?width=730&name=gcp-logo-cloud.png"
      alt=""
    />-->
    <div style="margin-top: 50px" >What ails you?</div>
  </div>
  <!-- article summarizer  -->
  <div
    class="flex flex-col lg:flex-row mx-4 space-y-6 lg:space-y-0 lg:mx-16 lg:justify-between"
    style="font-family: 'Lobster', cursive;"
  >
    <!-- input textarea  -->
    <TextareaComponent
      bind:text={inputText}
      name="Mindy is here for you, FIRE AWAY! :)"
      placeholder="Enter Text"
    />
    <!-- stats area  -->
    <div class="flex flex-col space-y-8 items-center justify-center" style="font-family: 'Lobster', cursive;">
      
      <!-- summarize button  -->
      <button
        disabled={loadingState}
        on:click={summarizeText}
        class="bg-blue-600 hover:scale-105 transition text-white font-bold text-xl h-fit p-4 rounded-lg"
      >
        {loadingState ? "Processing" : "Talk to Mindy"}
      </button>
      <!-- file input  -->
      <label
        for="upload-file"
        class="bg-blue-600 cursor-pointer p-4 rounded-lg hover:scale-105 transition ease-in-out text-xl font-bold text-white"
        >Upload File (.txt)</label
      >
      <input
        id="upload-file"
        type="file"
        accept=".txt"
        on:change={fileUpload}
        bind:this={file}
        hidden
      />
      <!-- input characters  -->
      <div
        class="text-xl hover:scale-105 transition font-bold text-center bg-white text-blue-600 p-4 rounded-lg"
        style="font-family: 'Lobster', cursive;"
      >
        Your Woes <br />
        {inputText.length}
      </div>
      <!-- output characters  -->
      <div
        class="text-xl hover:scale-105 transition font-bold text-center bg-white text-blue-600 p-4 rounded-lg"
        style="font-family: 'Lobster', cursive;"
      >
        Mindy's Thoughts <br />
        {outputText.length}
      </div>
    </div>
    <!-- output textarea  -->
    <TextareaComponent bind:text={outputText} name="Summary" readOnly />
  </div>

  <!-- Display the analysis result -->
  {#if analysisResult}
  <div class="bg-white p-4 mt-4 rounded-lg"  style="font-family: 'Lobster', cursive;">
    <h3 class="white header">Analysis Result (LET'S TRY TO KEEP THAT SCORE POSITIVE!):</h3>
    <p>Score: {analysisResult.score}</p>
    <p>Positive Words: {analysisResult.positive.join(', ')}</p>
    <p>Negative Words: {analysisResult.negative.join(', ')}</p>
  </div>
  {/if}

<style>
  /* Add your CSS styles in the style block */
  .white-header {
      color: white; /* Set the text color to white */
  }
</style>

  <!-- footer  -->
  <div
    class="bg-blue-600 flex-row flex text-white p-4 shadow-lg text-xl mt-4 lg:mt-16 sticky top-[100vh]"
  >
    <a
      href="https://github.com/gcharles85"
      target="_blank"
    >
      <div>Made by Guyriano Charles</div>
    </a>
  </div>
</div>
