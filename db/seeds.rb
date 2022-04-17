images = [
  "https://www.logobook.ru/make_nimage.php?uid=15027580",
  "https://www.moscowbooks.ru/image/book/476/orig/i476691.jpg?cu=20180101000000",
  "https://images-na.ssl-images-amazon.com/images/I/71FsXsYXGCL.jpg",
  "http://harrypottercollectables.com/wp-content/uploads/2020/08/harry-potter-deathly-hallows-first-print-hardback-4-scaled.jpg",
  "http://harrypottercollectables.com/wp-content/uploads/2021/06/IMG_8304-scaled.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Gutenberg_Bible%2C_Lenox_Copy%2C_New_York_Public_Library%2C_2009._Pic_01.jpg/447px-Gutenberg_Bible%2C_Lenox_Copy%2C_New_York_Public_Library%2C_2009._Pic_01.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTccwkRRC_JmlvY8hVlD6p3D-stXlIRx7MnQQ&usqp=CAU",
  "https://cdn1.teebooks.com/6364-large_default/white-bookcase-w60-h100-d15-cm-4-shelves.jpg",
  "https://image.shutterstock.com/z/stock-photo-a-picture-of-the-beautiful-view-of-birds-1836263689.jpg",
  "https://static.independent.co.uk/2021/12/07/10/PRI213893584.jpg?quality=75&width=982&height=726&auto=webp",
  "https://www.imgonline.com.ua/examples/bee-on-daisy.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSdOxrCFksuoU6GRVM6wZtgnIBbdrawa5JJw&usqp=CAU",
  "https://image.shutterstock.com/image-photo/nature-picture-very-beautiful-scene-260nw-1930964750.jpg",
  "https://cdn.mos.cms.futurecdn.net/yL3oYd7H2FHDDXRXwjmbMf.jpg",
  "https://i.guim.co.uk/img/media/8520a183158b571308d88261633b788173f7b358/0_0_9000_6000/master/9000.jpg?width=465&quality=45&auto=format&fit=max&dpr=2&s=6a03bb4e55cf29036a6e2f613d00a78c",
  "https://sm.pcmag.com/pcmag_uk/how-to/w/what-to-do/what-to-do-when-your-computer-screen-wont-show-a-picture_uvh8.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQy4xBjTgnsGGO4tviHvMCnOvOSKr9DNeM6w&usqp=CAU",
  "https://images.hindustantimes.com/img/2021/06/26/1600x900/Leopard_viral_picture_1624693839680_1624693862848.jpg",
  "https://www.gannett-cdn.com/-mm-/322f5d74305547090bc274f56107e40846bee274/c=0-154-3000-1849/local/-/media/2015/07/02/USATODAY/USATODAY/635714294919808513-XXX-GAN-TECH-SURF-REPORT-012915-2-70386674.JPG?width=3000&height=1695&fit=crop&format=pjpg&auto=webp",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_K716f4YRNgqfkbfiIcy0nVBAYFzEwNw2-Q&usqp=CAU",
  "https://images.squarespace-cdn.com/content/v1/5506a9b3e4b00b62e1675ded/e673d5b3-15a8-42f3-9d2b-45fb4d06bb72/CatherinePearson_Dragonfly_PictureBook_Spread05.jpeg?format=1000w",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJMsiqvwSw0Ieqqle4zQMhYxoLsESTsdkZZw&usqp=CAU",
  "https://image.shutterstock.com/image-photo/lovely-beach-picture-beautiful-260nw-1554809048.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpYBQ5QuFYjo_smGfEi-5pINbgrgaZ478z4w&usqp=CAU",
  "https://www.earthtouchnews.com/media/1951732/bigpicture_black-grouse_2019-05-02.jpg",
  "https://static01.nyt.com/images/2018/10/04/magazine/04blackhole1/04blackhole1-articleLarge-v3.jpg?quality=75&auto=webp&disable=upscale",
  "https://jooinn.com/images/black-macaca-2.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-Pj-yC01kbMz4nevQXBTLMbT-OGLh1IB7Fw&usqp=CAU",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://wl-brightside.cf.tsp.li/resize/728x/jpg/0bd/d10/13865e5400aee5a4c2ca471185.jpg",
  "https://images.newscientist.com/wp-content/uploads/2020/01/29190056/inouyesun.jpg?width=300",
  "https://images.newscientist.com/wp-content/uploads/2019/04/08111018/screenshot-2019-04-08-10.24.34.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNxAHBcYn-y9VqmEWxr4Ly4cZGMn5lg0dxCA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR3bd-0Z0P-QjbyoT-TtuEqkdg7QDIeXRL0w&usqp=CAU"
]


@user = User.create(name: "admin", password: "admin", password_confirmation: "admin", admin: true)
@user = User.create(name: "test", password: "test", password_confirmation: "test", admin: true)

categories_names = ["Testes", "Test1", "Test2", "Test3", "Test4", "Test5"]

categories_names.each do |name|
  Category.create!(name: name)
end


categories = Category.all

images.each_with_index do |image, index|
  product_params = {
    title: "Book #{index + 1}",
    description: "test",
    price: 100 * (index + 1),
    image_url: image,
    discount: 0.1 * (index + 0.1),
    category_id: categories.sample.id

  }

  product = Product.new(product_params)
  product.save!
end

