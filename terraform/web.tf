resource "aws_s3_bucket" "web" {
    bucket = "listen-later-web-page"
    acl    = "public-read"

    website {
        index_document = "index.html"
        error_document = "error.html"
    }
}

# TODO automatic bucket updates
resource "aws_s3_bucket_object" "home" {
    bucket = "listen-later-web-page"
    key    = "index.html"
    source = "../web/dummy.html"
    acl    = "public-read"
    content_type = "text/html"

    etag = filemd5("../web/dummy.html")

    depends_on = [aws_s3_bucket.web]
}