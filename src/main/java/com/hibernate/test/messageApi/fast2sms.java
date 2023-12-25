//
//import kong.unirest.HttpResponse;
//import kong.unirest.JsonNode;
//import kong.unirest.Unirest;
//public class fast2sms {
//    public static void main(String[] args) {
//
//        HttpResponse<String> response = Unirest.post("https://inteltech.p.rapidapi.com/send.php")
//                .header("content-type", "application/x-www-form-urlencoded")
//                .header("X-RapidAPI-Key", "a7ff05854emshee29e960e01180cp194a39jsn4505b7366936")
//                .header("X-RapidAPI-Host", "inteltech.p.rapidapi.com")
//                .body("sms=%2B916383180146&message=i%20am%20a%20gost&key=1B490066-EA03-E39A-A18C-C4868E45CFAE&username=temp-idk-test-dynamic")
//                .asString();
//
//        System.out.println(response.getBody());
//    }
//}
