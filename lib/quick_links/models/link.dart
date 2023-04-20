class Link {
  final String? icon, title, description, url;

  Link({this.url, this.icon, this.title, this.description});
}

List demoLinks = [
  Link(
    url: 'https://chat.openai.com',
    icon: "assets/icons/xd_file.svg",
    title: "Chat GPT 3",
    description: "Chat with GPT 3",
  ),
  Link(
    url: "https://www.grammarly.com",
    icon: "assets/icons/xd_file.svg",
    title: "Grammarly",
    description: "Check your grammar",
  ),
  Link(
    url: "https://www.naturalreaders.com/online/",
    icon: "assets/icons/xd_file.svg",
    title: "Speak text",
    description: "Read text out loud",
  ),
  Link(
    url: "https://tome.app",
    icon: "assets/icons/xd_file.svg",
    title: "Tome",
    description: "Make presentaion with AI",
  ),
  Link(
    url: "https://www.canva.com",
    icon: "assets/icons/xd_file.svg",
    title: "Canva",
    description: "Create a logo",
  ),
  Link(
    url: "https://10web.io/ai-assistant/",
    icon: "assets/icons/xd_file.svg",
    title: "10web",
    description: "Create a logo",
  ),
  Link(
    url: "https://app.landbot.io/",
    icon: "assets/icons/xd_file.svg",
    title: "Landbot",
    description: "Create a chatbot",
  ),
  Link(
    url: "https://www.mindomo.com",
    icon: "assets/icons/xd_file.svg",
    title: "Mindomo",
    description: "Create a mind map",
  ),
  Link(
    url: "https://www.duolingo.com",
    icon: "assets/icons/xd_file.svg",
    title: "Duolingo",
    description: "Learn a language for free",
  ),
  Link(
    url: "https://pfpmaker.com/",
    icon: "assets/icons/xd_file.svg",
    title: "PFP Maker",
    description: "Create a profile picture",
  ),
  Link(
    url: "https://app.brandmark.io/v3/",
    icon: "assets/icons/xd_file.svg",
    title: "Brandmark",
    description: "Create a logo",
  ),
  Link(
    url: "https://krisp.ai/",
    icon: "assets/icons/xd_file.svg",
    title: "Krisp",
    description: "Remove background noise",
  ),
  Link(
    url: "https://experiments.withgoogle.com/thing-translator",
    icon: "assets/icons/xd_file.svg",
    title: "Thing Translator",
    description: "Translate anything",
  ),
  Link(
    url: "https://www.craiyon.com/",
    icon: "assets/icons/xd_file.svg",
    title: "Craiyon",
    description: "Create a logo",
  ),
  Link(
    url: "https://www.midjourney.com/",
    icon: "assets/icons/xd_file.svg",
    title: "Midjourney",
    description: "Create a logo",
  ),
  Link(
    url: "https://openai.com/product/dall-e-2",
    icon: "assets/icons/xd_file.svg",
    title: "Dall-E",
    description: "Create a logo",
  ),
];
// first 4
List demoRecentLinks = demoLinks.sublist(0, 4);
