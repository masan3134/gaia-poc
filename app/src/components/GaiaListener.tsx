import { useEffect, useState } from 'react';
export default function GaiaListener() {
  const [messages, setMessages] = useState<any[]>([]);
  useEffect(() => {
    window.addEventListener('message', e => {
      if (e.data?.type === 'GAIA_DUMP') {
        setMessages(m => [...m, e.data.payload]);
      }
    });
  }, []);
  return (
    <div>
      <h2>Toplanan Mesajlar: {messages.length}</h2>
      <ul>
        {messages.map((m, i) => (
          <li key={i}><strong>{m.role}:</strong> {m.content}</li>
        ))}
      </ul>
    </div>
  );
}
