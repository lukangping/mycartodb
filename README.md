http://delanover.com/2012/12/21/build-an-openstreetmap-server-on-ubuntu-10-04/

http://gurrier.wordpress.com/2010/10/02/downlolading-repo-keys-from-behind-a-corporate-firewall/

https://bugs.launchpad.net/ubuntu/+source/software-properties/+bug/516032

http://askubuntu.com/questions/53146/how-do-i-get-add-apt-repository-to-work-through-a-proxy


cartodb作为webgis全套解决方案，包括地图服务器（基于强大的mapnik地图渲染引擎），数据库服务器，缓存服务器；提供js、sql api实现用户的交互 ，并为初学者提供方便的操作平台，在一些大型互联网应用中如Twitter，NASA得到成功验证。
  基于目前Nastar Geo的系统架构，需要我们对cartodb进行一定的改造，以支撑目前的
  
  
  
  
  <?xml version="1.0" encoding="utf-8"?>
<Map srs="+init=epsg:4326" background-color="white">
    <Style name="style">
        <Rule>
            <PointSymbolizer />
            <TextSymbolizer face-name="DejaVu Sans Book" size="10" dx="5" dy="5"/>
        </Rule>
    </Style>
    <Layer name="test" srs="+init=epsg:4326">
        <StyleName>style</StyleName>
  
import mapnik
import shapely.geometry
class TestDatasource(mapnik.PythonDatasource):
    def __init__(self):
        super(TestDatasource, self).__init__()

    def features(self, query):
        return mapnik.PythonDatasource.wkb_features(
            keys = ('label',),
            features = (
                ( shapely.geometry.Point(5,6).wkb, { 'label': 'foo-bar'} ),
                ( shapely.geometry.Point(100,60).wkb, { 'label': 'buzz-quux'} ),
            )
        )
      <Datasource>
            <Parameter name="type">python</Parameter>
            <Parameter name="factory">TestDatasource</Parameter>
        </Datasource>
    </Layer>
</Map>






