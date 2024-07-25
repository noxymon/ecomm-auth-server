How to run application :

`mvn clean spring-boot:run`

1. You need to generate PKCE
- Code Verifier : 43 - 128 random string. Example : `EmJ1jTS245HXMu5dDFc36XlEK02FCfT3BAvbvVfBiXSl`
- Code Challenge : SHA256(code verifier). Example : `ea3rEXbTCcvWGOL2m6J1lT2VWv-sLrnS2i-UeaNENbw`

2. Access `authorization_endpoint` with Code verifier and code challenger generated previously :
```
http://localhost:8080/oauth2/authorize?client_id=ott_app&redirect_uri=http://example.com&response_type=code&scope=openid&state=abcd1234&code_challenge_method=S256&code_challenge=ea3rEXbTCcvWGOL2m6J1lT2VWv-sLrnS2i-UeaNENbw
```

3. Login with username `user001` and password `teststaff`

4. Approve consent page

5. get `authorization_code` after successfully login. retrieve this code after `code` parameter on url

6. exhange the `authorization_code` to `access_token` by using this endpoint : 
```
curl --location --request POST 'http://localhost:8080/oauth2/token' \
   --header 'Authorization: Basic bW9iaWxlYXBwOmFiY2Q=' \
   --header 'Content-Type: application/x-www-form-urlencoded' \
   --data-urlencode 'grant_type=authorization_code' \
   --data-urlencode 'redirect_uri=http://example.com' \
   --data-urlencode 'client_id=mobileapp' \
   --data-urlencode 'code=s2QnpXbI7y2TB89HKK_s52Vm9d0r_XYd_OCPr7_sqvq4i0zApwDSK8g44JZaWoZjUiOAowaXHwknBah133cVmF9ng5noqibE45lAFo3ruKYTwxiDr32K81jzB6z3JyRr' \
   --data-urlencode 'code_verifier=EmJ1jTS245HXMu5dDFc36XlEK02FCfT3BAvbvVfBiXSl'
```

it should be responded with this :

```json
{
    "access_token": "eyJraWQiOiIzYTM5ZDdhNy0yMjc4LTQwZjYtOTgxNS03YWY5MzkwNmRkMzEiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJ1c2VyMDAxIiwiYXVkIjoibW9iaWxlYXBwIiwibmJmIjoxNjI2OTA4NzEzLCJpc3MiOiJodHRwOlwvXC9hdXRoLXNlcnZlcjo5MDAwIiwiZXhwIjoxNjI2OTA5MDEzLCJpYXQiOjE2MjY5MDg3MTMsImp0aSI6ImZkYmNhMzQ0LTAxMDgtNDU2NC1iNWYxLWQ2Y2FjYjJjZDZkYSJ9.qlzoGCoUjrZcAhzPZGQKO4TT6JZrS7NABOvxh2pT_WWulj98HBYBz1sRhh9dbnJIovNu448aNAzT8othGP8ZHl-kzYrrHq4S58uS3oWfu3o5pjfF-k0CCYVSLyyYi0BdZWnUjJhn-p_CNOlh5779wt5H5Tck8b5Jz4hcZXeGgtpIiWmRNtsrOB-9W2yY5Tp1jn10J4FwxIJR5sxubtZqidNC_zvQ0GoE_ee8QkhgN1zdmtRGI3uunqr83dZrwkbmCFcEGJr03X9RJnMzEZRQMsHNqdhCDpXMsGohwpyz1b1iyFC-rqb5i-14zSIgQWJ1ce-M0DGa_Oyhni9GyMoHgQ",
    "refresh_token": "NV_HKGl3r0Wt1FQ8ao9DkIZsa9hMAFxYE6GN2F_R8tpix1O6crkw2k_FVz_4ZqFIroaoyS2j-nJqQmkgi9eAvVuJd_XghMJD7fY2rIRO1bUiml9HguAxoHypLjTgKWqv",
    "token_type": "Bearer",
    "expires_in": 299
}
```

7. Decode at JWT.io, user detail will be on JWT body