## Ý tưởng không mới, chưa ai làm tới!

https://user-images.githubusercontent.com/8133/189085556-2d5768fb-dda0-424d-9d41-1de51449a565.mp4

**[Hướng dẫn cài đặt](docs/INSTALL.md)**

### Một số phím tắt cài sẵn

- `command+shift` hoặc `windows+shift` để tắt / bật chế độ gõ.
- Lựa chọn đoạn text tiếng Anh rồi `command+esc` hoặc `windows+esc` để dịch google.

### Tính năng

> !! __Lưu ý__: người dùng có thể gõ rất nhanh nên, các tính năng tốn tài nguyên như gợi ý nâng cao nếu tích hợp thời gian thực vào lúc gõ có thể gây lag !!

=> Các tính năng dùng tới `machine learning` chắc chắn thuộc về phần xử lý hậu kỳ, khi người dùng đã gõ xong và hệ thống phát hiện ra sự không hợp lý và đưa ra các gợi ý. Các xử lý này chạy trong `threads` riêng để không làm lag quá trình gõ phím tốc độ cao của người dùng.

- [ ] Lưu ORIGIN của các từ TV được chuyển hóa gần đây để tiện cho việc undo từ tiếng Việt trở lại thành tiếng Anh Việt (chuỗi ký tự gốc)

- [ ] Tự động gợi ý từ đang gõ. Có thể giả sử các từ gõ trước luôn đúng (vì khi gõ sai người dùng thường sẽ sửa ngay trước khi gõ từ tiếp theo).

- [ ] Tính năng chữa lỗi chính tả bằng cách thống kê `n-gram` các văn bản có trong current folder. | [tham khảo JamSpell](https://github.com/bakwc/JamSpell)

- [ ] Làm chặt chẽ hơn luật ngữ âm của `bogo`, ví dụ `bẻp, tấo ..` là những từ ko tồn tại trong tiếng Việt.

- [ ] Dùng phím `~` để chuyển giữa tiếng Anh và tiếng Việt trong những trường hợp nhập nhằng.

- [x] Dùng `datrie` để xác định từ đang gõ có thể là tiếng Anh hay ko? Nếu có thể là từ tiếng Anh thì mới hiện ở pop-up
- [x] Khi viết code chỉ gõ dc TV trong comment và string
- [x] Hover để tra từ điển Anh - Việt | [tham khảo plugin Dictionary](https://github.com/futureprogrammer360/Dictionary)
- [x] Hiển thị nguyên gốc, TV hiển thị ở popup, nhấn `space` tự động chọn TV, `tab` bỏ qua
- [x] Chọn đoạn text tiếng Anh, nhấn `command+esc` để google translate. Tiện ích cho việc dịch văn bản