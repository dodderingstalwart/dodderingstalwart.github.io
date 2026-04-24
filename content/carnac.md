---
title: "Funk and Wagnalls Porch"
date: 2026-02-12
description: "Fetch Jokes and Insults from database"
---

<div class="carnac-container">
  <div class="carnac-header">
    <img src="/images/carnac.jpg" alt="Carnac the Magnificent" class="carnac-image">
    <h1>Carnac the Magnificent</h1>
    <p class="carnac-subtitle">Wisdom from the all-knowing, all-seeing sage and soothsayer of the East!</p>
  </div>

  <div class="carnac-section">
    <h2>Get a Carnac Joke</h2>
    <button id="joke-btn" class="carnac-button">Divine the Answer!</button>
    <div id="joke-display" class="carnac-result"></div>
  </div>

  <div class="carnac-section">
    <h2>Get an Insult</h2>
    <button id="insult-btn" class="carnac-button">Boooooo!!!</button>
    <div id="insult-display" class="carnac-result"></div>
  </div>

  <div id="loading" class="loading" style="display: none;">
    <span>Opening the envelope</span>
  </div>

  <div id="error-display" class="error-message" style="display: none;"></div>
</div>

<style>
  .carnac-container {
    max-width: 800px;
    margin: 2rem auto;
    padding: 2rem;
    font-family: 'Georgia', serif;
  }

  .carnac-header {
    text-align: center;
    margin-bottom: 3rem;
  }

  .carnac-image {
    max-width: 200px;
    border-radius: 10px;
    margin-bottom: 1rem;
  }

  .carnac-subtitle {
    font-style: italic;
    color: #666;
    font-size: 1.1rem;
  }

  .carnac-section {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 15px;
    padding: 2rem;
    margin: 2rem 0;
    color: white;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  }

  .carnac-section h2 {
    margin-top: 0;
    font-size: 1.8rem;
  }

  .carnac-button {
    background: white;
    color: #667eea;
    border: none;
    padding: 1rem 2rem;
    font-size: 1.2rem;
    font-weight: bold;
    border-radius: 50px;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    margin: 1rem 0;
  }

  .carnac-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
    background: #f0f0f0;
  }

  .carnac-button:active {
    transform: translateY(0);
  }

  .carnac-result {
    background: rgba(255, 255, 255, 0.9);
    color: #333;
    padding: 1.5rem;
    border-radius: 10px;
    margin-top: 1rem;
    min-height: 60px;
    font-size: 1.1rem;
    line-height: 1.6;
  }

  .carnac-result:empty {
    display: none;
  }

  .joke-question {
    font-weight: bold;
    color: #667eea;
    margin-bottom: 0.5rem;
  }

  .joke-answer {
    color: #764ba2;
    font-style: italic;
  }

  .loading {
    text-align: center;
    font-style: italic;
    color: #667eea;
    padding: 1rem;
    animation: pulse 1.5s infinite;
  }

  @keyframes pulse {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.5; }
  }

  .error-message {
    background: #ff6b6b;
    color: white;
    padding: 1rem;
    border-radius: 8px;
    margin-top: 1rem;
    text-align: center;
  }

  @media (max-width: 600px) {
    .carnac-container {
      padding: 1rem;
    }
    
    .carnac-section {
      padding: 1.5rem;
    }
  }
</style>

<script>
  const API_URL = 'https://carnac-api.fly.dev/api'

  function setLoading(isLoading) {
    const loadingE1 = document.getElementById('loading');
    const jokeBtn = document.getElementById('joke-btn');
    const insultBtn = document.getElemenetById('insult-btn');

    if (isLoading) {
      loadingE1.style.display = 'block';
      jokeBtn.disabled = true;
      insultBtn.disabled = true;
    } else {
      loadingE1.style.display = 'none';
      jokeBtn.disabled = false;
      insultBtn.disabled = false
    }
  }
  
  function showError(message) {
    const errorE1 = document.getElementById('error-display');
    errorE1.textContent = message;
    errorE1.style.display = 'block';
    setTimeout(() => {
      errorE1.style.display = 'none';
    }, 5000);
  }

  async function getjoke() {
    const display = document.getElementById('joke-display');
    setLoading(true);

    try {
      const response = await fetch(`${API_URL}/jokes/random`);

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const joke = await response.json();

      display.innerHTML = 
        <div class="joke-answer"> ${joke.answer}</div>
        <div class="joke-question"> ${joke.question}</div>
        ;
    } catch (error) {
      console.error('Error fetching joke:', error);
      showError('Failed to fetch joke.');
      display.innerHTML = '';
    } finally {
      setLoading(false)
    }
  }

  async function getInsult() {
    const display = document.getElementById('insult-display');
    setLoading(true)

    try {
      const display = await fetch(`${API_URL}/insults/random`);
    

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const data = await response.json();

      display.innerHTML = `<p> ${data.insult}</p>`;
    } catch (error) {
      console.error('Error fetching insult:', error);
      showError('Failed to fetch insult');
      display.innerHTML = '';
    } finally {
      setLoading(false);
    }
  }

  document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('joke-btn').addEventListener('click', getJoke);
    document.getElementById('insult-btn').addEventListener('click', getInsult);
  });

</script>
