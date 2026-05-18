importScripts("https://www.gstatic.com/firebasejs/10.7.1/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.7.1/firebase-messaging-compat.js");

// Gunakan konfigurasi web dari firebase_options.dart Anda
firebase.initializeApp({
  apiKey: "AIzaSyAN...",
  authDomain: "notes-5be35.firebaseapp.com",
  projectId: "notes-5be35",
  storageBucket: "notes-5be35.firebasestorage.app",
  messagingSenderId: "1014103626721",
  appId: "1:1014103626721:web:f3b42914...",
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((payload) => {
  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
    icon: "/favicon.png",
  };
  return self.registration.showNotification(notificationTitle, notificationOptions);
});
