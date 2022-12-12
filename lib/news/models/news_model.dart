//while the app is building let's create the NewsData class

class NewsData {
  String? title;
  String? author;
  String? content;
  String? urlToImage;
  String? date;

  //let's create the constructor
  NewsData(
    this.title,
    this.author,
    this.content,
    this.date,
    this.urlToImage,
  );

  //we will use dummy data to generate the news,but you can use a third party api or your own backend to extract the data
  //I will copy the data from my previous code, you can create your own data , I used newsApi to get the data
  static List<NewsData> breakingNewsData = [
    NewsData(
        "Indonesian Agriculture Will Make a real Nation",
        "herdwilia ramadanti",
        "Rice terraces near Jatiluwih, Bali, Indonesia.Agriculture sector has an important role in  national economic development structure. We know that agriculture in Indonesia is very spacious and potential. Without agriculture human being can not live, any sector will be paralyzed, and it means a big problem for our country. Agriculture has a role as a provider job opportunity, contributor for national income, and GDP contributor in Indonesia. But in a fact, agriculture sector in Indonesia is still weak and there are too many challenges for the agricultural sector. Those challenges become a hard job for all of us if we want agriculture to drive improvements in public welfare and can force national development.  We need agricultural revolution to make Indonesia become a great nation.",
        "2020-04-06",
        "https://media.clientearth.org/cache/7/f/4/9/6/d/7f496d8717fa60c638aed171b984c630654be7fc.jpg"),
    NewsData(
        "Agricultural Sector of Indonesia",
        "Indonesia-Investments",
        "With its vast and abundant fertile soils Indonesia is a major global key producer of a wide variety of agricultural tropical products, and although agriculture's share of the country's gross domestic product (GDP) has declined markedly during the last five decades, it still provides income for the majority of Indonesian households today. In 2012 this sector employed around 49 million Indonesian individuals, which represents 41 percent of the total Indonesian labour force. But although in absolute numbers the agricultural workforce keeps growing, its relative share of the total Indonesian workforce has declined significantly from 55 percent in the 1980s to 45 percent in the 1990s and currently to 41 percent. Only during the Asian Financial Crisis in the late 1990s this share grew significantly because unemployment in both the industry and services sectors was absorbed by the agriculture sector (mostly informally).",
        "2022-08-11",
        "https://64.media.tumblr.com/tumblr_lngf2bUTm51qdvx1bo1_500.jpg"),
    NewsData(
        "Agriculture industry in Indonesia- statistics & facts",
        "Statista Research Department",
        "Indonesia is one of the world's largest producers and exporters of agricultural products, supplying important commodities such as palm oil, natural rubber, cocoa, coffee, rice, and spices to the rest of the world. In the past decades, the agricultural industry is also the largest sector of employment in the country. However, the share of the Indonesian agricultural sector's GDP has been decreasing as the country shifts towards industrialization.",
        "2022-11-11",
        "https://static01.nyt.com/images/2022/06/12/nyregion/12hudsonvalleyfarms-promo/09hudsonvalleyfarms-promo-videoSixteenByNine3000.jpg"),
  ];

  static List<NewsData> recentNewsData = [
    NewsData(
        "Summary of Indonesia's Agriculture",
        "Quincieu, Eric",
        "Despite increasing food crop production, food security is challenged in the medium term by declining irrigation and logistics chain infrastructure. Food security would also be enhanced through an increase of higher value cropping, greater commercialization, and allowing land leasing to gain economies of scale in farm sizes, and facilitating re-investment by small farmers. The government of Indonesia’s 2015–2019 National Medium-Term Development Plan (RPJMN) highlights two distinct roles of the agriculture sector which are to (i) increase rice production for food security, and (ii) develop higher value cropping to improve rural livelihoods.",
        "2022-11-20",
        "https://images.thewest.com.au/publication/B881988110Z/1630402638175_G9R3EUEAR.2-2.jpg"),
    NewsData(
        "Agriculture Opportunity in Indonesia",
        "Market Research Indonesia",
        "As the fourth-largest global producer of agricultural products, Indonesia's farming practice plays a vital part in the country's development. The sector contributes to over a third of the nationwide workforce and extensive shares to the overall gross domestic product (GDP). The agriculture sector takes up to 30 percent of the country's available land, with most of it being large-scale plantations of palm oil. Other common commodities acting as essential export products are rice, soybeans, corn, fruits, and vegetables. In recent years, the Indonesian government has emphasized agricultural self-sufficiency on several commodities stapled to the country, such as rice. The country still imports rice from neighboring countries to secure the domestic rice supply catering to the significant per capita consumption. Therefore, governmental programs have since covered revitalization programs for individual farmers to push higher production.",
        "2022-11-30",
        "https://i.pinimg.com/originals/3a/80/80/3a8080d8a975b42fc3635ea302152f13.jpg"),
    NewsData(
        "Indonesian Commodity Prospects ",
        "Cekindo",
        "Indonesian commodities contributed about one-fourth of Indonesia's Gross Domestic Product (GDP) and government revenue in 2007. This has led Indonesia to become one of the largest global commodity exporters.  Check out some interesting facts about Indonesian commodities: Indonesia is the largest palm oil producer in the world. CPO exports reached US\$19 billion in 2013 and account for 3.8 milion full-time jobs. CPO production in Indonesia continues to increase annually, with an average growth of 12.3 %. In 2013 the production of CPO  in Indonesia reached 27.0 million metric tons of crude palm oil. Currently, Indonesia is the world leader in CPO production. In fact, Indonesia and Malaysia together generate more than 85 percent of the world supply.",
        "2022-12-09",
        "https://i2.pickpik.com/photos/305/197/189/corn-field-cornfield-agriculture-preview.jpg"),
    NewsData(
        "How can Indonesia assist its farmers?",
        "Peter Warr, ANU",
        "At a press conference introducing the recent Asian Agriculture and Food Forum in Jakarta, organised by the Indonesian Farmers Association (HKTI), the Association's Secretary-General Bambang Budi Waluyo said that Indonesian farmers face five issues in improving their welfare: working capital access, high quality seeds, fertilisers, agricultural technology and efficient distribution. These are indeed issues facing Indonesia’s commercial agricultural sector and associated agribusiness. They are worthy of discussion. But they are not the main problems of Indonesian farmers. As in the rest of Asia, Indonesian agriculture is dominated by smallholders. Their problems are poverty and indebtedness.",
        "2022-11-02",
        "https://cdn.vox-cdn.com/thumbor/Vz6ibJXlCOYWAguAckMLQ5z7_EM=/1400x0/filters:no_upscale()/cdn.vox-cdn.com/uploads/chorus_asset/file/6485569/shutterstock_164205476.jpg"),
  ];
}
