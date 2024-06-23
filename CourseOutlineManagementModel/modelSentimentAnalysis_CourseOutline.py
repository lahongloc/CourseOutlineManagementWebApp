from flask import Flask, request, jsonify
import torch
from transformers import PhobertTokenizer, BertForSequenceClassification
import random
import threading

app = Flask(__name__)
thread_local = threading.local()

# Tải và sử dụng mô hình PheBERT đã được huấn luyện
model_name = 'vinai/phobert-base'
tokenizer = PhobertTokenizer.from_pretrained(model_name)
model = BertForSequenceClassification.from_pretrained(
    model_name,
    num_labels=2)  # Điều chỉnh số nhãn thành 2: tích cực và tiêu cực

def get_model():
    if not hasattr(thread_local, 'model'):
        thread_local.model = BertForSequenceClassification.from_pretrained(
            model_name,
            num_labels=2)
    return thread_local.model

# Hàm dự đoán cảm xúc của bình luận
def predict_sentiment(comment):
    model = get_model()
    inputs = tokenizer(comment, return_tensors='pt', padding=True, truncation=True)
    with torch.no_grad():
        outputs = model(**inputs)
    logits = outputs.logits
    probabilities = torch.softmax(logits, dim=-1).squeeze()
    predicted_label = torch.argmax(probabilities).item()

    # 0 là tiêu cực, 1 là tích cực
    return predicted_label


def get_random_response(sentiment_label):
    positive_responses = [
        "Cảm ơn bạn, chúng tôi sẽ cố gắng phát huy!",
        "Rất vui vì bạn có cảm nhận tích cực về môn học này!",
        "Chúng tôi rất vui khi nhận được ý kiến tích cực từ bạn!",
        "Chúng tôi rất cảm kích sự ủng hộ nhiệt tình từ phía bạn!",
        "Ý kiến của bạn là động lực lớn để chúng tôi nỗ lực hơn nữa!",
        "Chân thành cảm ơn bạn đã chia sẻ cảm nhận tích cực này!",
        "Chúng tôi rất hạnh phúc khi biết bạn thích môn học này!",
        "Phản hồi tích cực của bạn là động lực lớn cho chúng tôi!",
        "Cảm ơn bạn đã đóng góp ý kiến tích cực quý báu này!",
        "Chúng tôi rất vui lòng khi nhận được phản hồi tốt đẹp từ bạn!",
        "Cảm ơn bạn rất nhiều về những lời động viên này!",
        "Chúng tôi rất vui khi bạn thấy môn học này có ích!",
        "Ý kiến tích cực của bạn là nguồn động lực lớn!",
        "Rất cảm kích về phản hồi tích cực từ bạn!",
        "Cảm ơn bạn đã chia sẻ những suy nghĩ tích cực này với chúng tôi!",
        "Chúng tôi rất hân hoan khi nhận được sự đánh giá tích cực từ bạn!",
        "Phản hồi tích cực của bạn là nguồn động lực lớn cho chúng tôi!",
        "Cảm ơn bạn đã chia sẻ cảm nhận tích cực này với chúng tôi!",
        "Ý kiến của bạn là động lực lớn để chúng tôi nỗ lực hơn nữa!",
        "Chúng tôi rất vui mừng khi biết bạn hài lòng với môn học này!"
    ]
    negative_responses = [
        "Cảm ơn bạn đã đóng góp, nhưng chúng tôi cho rằng bình luận của bạn không phù hợp với môi trường đại học.",
        "Chúng tôi sẽ xem xét lại để cải thiện môn học này.",
        "Chúng tôi sẽ cố gắng cải thiện để đáp ứng mong đợi của bạn.",
        "Xin lỗi về sự bất tiện này, chúng tôi sẽ cố gắng khắc phục vấn đề.",
        "Chúng tôi rất tiếc về trải nghiệm không tốt mà bạn đã gặp phải.",
        "Phản hồi của bạn rất quan trọng để chúng tôi có thể cải thiện môi trường học tập này.",
        "Cảm ơn bạn đã phản hồi thẳng thắn, chúng tôi sẽ cố gắng rút kinh nghiệm.",
        "Chúng tôi sẽ sớm xem xét lại và điều chỉnh mọi vấn đề bạn đã đề cập.",
        "Cảm ơn bạn đã chỉ ra điều này, chúng tôi sẽ cố gắng cải thiện chất lượng.",
        "Phản hồi của bạn giúp chúng tôi nhìn nhận mặt khác của vấn đề.",
        "Chúng tôi sẽ xem xét lại để cải thiện môi trường học tập này.",
        "Xin lỗi về sự bất tiện này, chúng tôi sẽ nỗ lực để khắc phục vấn đề.",
        "Chúng tôi sẽ đánh giá lại phản hồi của bạn để cải thiện hơn.",
        "Cảm ơn bạn đã đóng góp, chúng tôi sẽ học hỏi từ những lời phản hồi này.",
        "Phản hồi của bạn giúp chúng tôi nhận ra những vấn đề cần phải khắc phục.",
        "Cảm ơn bạn đã chia sẻ, chúng tôi sẽ nỗ lực để cải thiện.",
        "Chúng tôi sẽ cố gắng khắc phục các vấn đề bạn đã đề cập.",
        "Xin lỗi về sự không hài lòng này, chúng tôi sẽ làm tốt hơn.",
        "Phản hồi của bạn sẽ giúp chúng tôi nâng cao chất lượng môn học.",
        "Chúng tôi rất cảm kích sự thẳng thắn của bạn để chúng tôi cải thiện hơn."
    ]

    if sentiment_label == 1:
        return random.choice(positive_responses)
    else:
        return random.choice(negative_responses)


# API endpoint cho phân tích cảm xúc
@app.route('/sentiment', methods=['POST'])
def sentiment_analysis():
    content = request.json.get('content', '')
    if content.strip() == '':
        return jsonify({"error": "Không có nội dung được cung cấp"}), 400

    # Chuyển đổi content thành string nếu cần
    if not isinstance(content, str):
        content = str(content)

    sentiment_label = predict_sentiment(content)
    model_response = get_random_response(sentiment_label)

    response = {
        "sentiment": sentiment_label,
        "modelResponse": model_response
    }
    return jsonify(response)


if __name__ == '__main__':
    app.run(debug=True)
