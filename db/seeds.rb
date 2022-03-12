images = [
  "https://www.logobook.ru/make_nimage.php?uid=15027580",
  "https://www.moscowbooks.ru/image/book/476/orig/i476691.jpg?cu=20180101000000",
  "https://images-na.ssl-images-amazon.com/images/I/71FsXsYXGCL.jpg",
  "http://harrypottercollectables.com/wp-content/uploads/2020/08/harry-potter-deathly-hallows-first-print-hardback-4-scaled.jpg",
  "http://harrypottercollectables.com/wp-content/uploads/2021/06/IMG_8304-scaled.jpg"
]

images.each_with_index do |image, index|
  product_params = {
    title: "Book #{index + 1}",
    description: "test",
    price: 100 * (index + 1),
    image_url: image,
    discount: 0
  }
  product = Product.new(product_params)
  product.save!
end

