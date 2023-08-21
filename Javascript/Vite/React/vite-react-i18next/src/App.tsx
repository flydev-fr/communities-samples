import React, { Suspense, useState } from 'react';
import logo from './logo.svg';
import './App.css';

import { useTranslation } from 'react-i18next';

function MyApp() {
  const { t } = useTranslation();
  const [count, setCount] = useState(0);  
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>Hello Vite + React!</p>
        <p>
          <button type="button" onClick={() => setCount((count) => count + 1)}>
            count is: {count}
          </button>
        </p>

        <p>
          {' '}
          {t('Hello')}, you have {count} unread message(s).{' '}
        </p>

        <p>
          Edit <code>/public/locales/*.json</code> and save to test HMR updates.
        </p>
        <p>
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
          {' | '}
          <a
            className="App-link"
            href="https://vitejs.dev/guide/features.html"
            target="_blank"
            rel="noopener noreferrer"
          >
            Vite Docs
          </a>
        </p>
      </header>
    </div>
  );
}

export default function App() {
  return (
    <Suspense fallback="⏳ loading... ">
      <MyApp />
    </Suspense>
  );
}
