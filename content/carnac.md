---
title: "Funk and Wagnalls Porch"
date: 2026-02-12
description: "Fetch Jokes and Insults from database"
---

<div id="carnac-container">
  <div class="carnac-header">
  <h1>Carnac the Magnificent</h1>
  </div>

  <h2>Get a Carnac Joke</h2>
  <button onclick="getJoke()">Carnac Joke</button>
  <div id="joke-display"></div>

  <h2>Get an Insult</h2>
  <button onclick="getInsult()">Get Insult</button>
  <div id="insult-display"></div>

  <div id="display-error" class="error-message" style="display: none;"></div>
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
