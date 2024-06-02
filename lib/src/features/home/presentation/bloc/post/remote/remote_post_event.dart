abstract class RemotePostsEvent {
  const RemotePostsEvent();
}

class GetPosts extends RemotePostsEvent {
  const GetPosts();
}
