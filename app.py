from flask import Flask, jsonify, request
from flask_pymongo import PyMongo

app = Flask(__name__)

# MongoDB配置
app.config["MONGO_URI"] = "mongodb://my-mongo-mongodb:27017/myBlogDb"
mongo = PyMongo(app)

# 使用mongo.db.<collection>来访问集合
@app.route('/blogs', methods=['GET'])
def get_blogs():
    """获取所有博客文章"""
    blogs = mongo.db.blogs.find()
    return jsonify([blog for blog in blogs])

@app.route('/blogs', methods=['POST'])
def add_blog():
    """创建新的博客文章"""
    new_blog = request.get_json()
    mongo.db.blogs.insert_one(new_blog)
    return jsonify(new_blog), 201

# 添加健康检查路由
@app.route('/health', methods=['GET'])
def health_check():
    """健康检查路由"""
    return jsonify({"status": "healthy"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)