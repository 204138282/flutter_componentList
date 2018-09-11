class User {
  final String login;
  final int id;
  final String node_id;
  final String avatar_url;
  final String gravatar_id;
  final String url;
  final String html_url;
  final String followers_url;
  final String following_url;
  final String gists_url;
  final String starred_url;
  final String subscriptions_url;
  final String organizations_url;
  final String repos_url;
  final String events_url;
  final String received_events_url;
  final String type;
  final bool site_admin;
  final String name;
  final String company;
  final String blog;
  final String location;


  User({this.login,this.id, this.node_id, this.avatar_url, this.gravatar_id, this.url, this.html_url,
        this.followers_url, this.following_url, this.gists_url, this.starred_url, this.subscriptions_url, 
        this.organizations_url, this.repos_url, this.events_url, this.received_events_url, this.type, 
        this.site_admin, this.name, this.company, this.blog, this.location});

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      login: json['login'],
      id: json['id'],
      node_id: json['node_id'],
      avatar_url: json['avatar_url'],
      gravatar_id: json['gravatar_id'],
      url: json['url'],
      html_url: json['html_url'],
      followers_url: json['followers_url'],
      following_url: json['following_url'],
      gists_url: json['gists_url'],
      starred_url: json['starred_url'],
      subscriptions_url: json['subscriptions_url'],
      organizations_url: json['organizations_url'],
      repos_url: json['repos_url'],
      events_url: json['events_url'],
      received_events_url: json['received_events_url'],
      type: json['type'],
      site_admin: json['site_admin'],
      name: json['name'],
      company: json['company'],
      blog: json['blog'],
      location: json['location']
    );
  }
}