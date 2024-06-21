import { db } from './firebase';

const SendMessage = async (senderId, receiverId, messageContent) => {
  try {
    const chatRef = db.collection('chats').doc(`${senderId}_${receiverId}`);
    await chatRef.set({
      participants: [senderId, receiverId],
      messages: [
        {
          sender: senderId,
          content: messageContent,
          timestamp: new Date()
        }
      ]
    });
  } catch (error) {
    console.error('Error sending message:', error);
  }
};

export default SendMessage;
