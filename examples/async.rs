use youtube_dl::{YoutubeDl, YoutubeDlOutput};

#[tokio::main]
async fn main() {
    let output = YoutubeDl::new("https://www.youtube.com/watch?v=VFbhKZFzbzk")
        .socket_timeout("15")
        .run_async()
        .await
        .unwrap();
    let title = match output {
        YoutubeDlOutput::SingleVideo(video) => video.title,
        _ => panic!("single video should not be a playlist"),
    };
    println!("Video title: {}", title);
}
