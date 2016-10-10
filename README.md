# ISD

hướng dẫn cấu hình để chạy

bước 1: vào webconfig của cái TkSchool sửa password và data source sao cho thích hợp với sql server đã cài trong máy

bước 2: vào appconfig của TK.Business và sửa i hệt như webconfig trong bước 1

note: sửa lỗi object not refrernen as instance of object, vào webconfig chọn thẻ

<customErrors mode="Off" defaultRedirect="~/Views/Error/ErrorCommon">
      <error redirect="~/Error/ErrorCommon/" statusCode="404" />
    </customErrors>

sửa mode="Off" thành "On"
