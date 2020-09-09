import 'package:flutter/material.dart';
class CompanyOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Card(
        elevation: 8.0,  //设置
        margin: EdgeInsets.all(15),
        child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: _companyItem(
                          title: '字节跳动',
                          imgUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598334519535&di=9faba8984800120a08d5d528d568605e&imgtype=0&src=http%3A%2F%2Fstatic.lagou.com%2Fthumbnail_300x300%2Fi%2Fimage2%2FM00%2F1F%2F3F%2FCgotOVoM5s6AFFwRAAAuLYLC9XM864.png'
                        ),
                      ),
                      Expanded(
                        child: _companyItem(
                          title: '阿里巴巴',
                          imgUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598335668558&di=98584e88be6d9b7fcaacc3f0601ffba1&imgtype=0&src=http%3A%2F%2Fsrc.onlinedown.net%2Fsupply%2F1372064088_17046.png'
                        ),
                      ),
                      Expanded(
                        child: _companyItem(
                          title: '字节跳动',
                          imgUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598335768471&di=651a67d0636cc67bbb96ca3e7ab39554&imgtype=0&src=http%3A%2F%2Fzhaopin-rd5-pub.oss-cn-beijing.aliyuncs.com%2Fimgs%2Fcompany%2Ff131b23ae3960b8142e34a766620be1b.jpeg'
                        ),
                      ),
                      Expanded(
                        child: _companyItem(
                          title: '网易',
                          imgUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598336351896&di=2e4f4710f93d50b589b699aee6cd1f74&imgtype=0&src=http%3A%2F%2Fimg.files.swws.258.com%2F1%2F2016%2F0808%2F13%2F57a8182edcddb.jpg'
                        ),
                      )
                    ],
                  ),
                )
              ),
              Container(
                width: 40,
                alignment: Alignment.center,
                child: FlatButton(onPressed: (){}, child: Text('查看全部', 
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _companyItem ({@required String title, @required String imgUrl}){
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xffeeeeee),
                width: 0.5
              )
            ),
            child: Image.network(imgUrl),
          ),
          Text(title, style: TextStyle(
            fontSize: 12,
            color: Color(0xff666666),
          ))
        ],
      ),
    );
  }
}