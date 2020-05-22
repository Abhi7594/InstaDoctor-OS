//
//  ServiceHelper.swift

import UIKit

let timeoutInterval:Double = 45

enum loadingIndicatorType: CGFloat
{
    case `default`  = 0 // showing indicator & text by disable UI
    case simple  = 1 // // showing indicator only by disable UI
    case noProgress  = 2 // without indicator by disable UI
    case smoothProgress  = 3 // without indicator by enable UI i.e No hud
}

enum MethodType: CGFloat
{
    case get  = 0
    case post  = 1
    case put  = 2
    case delete  = 3
}

var hud_type: loadingIndicatorType = .default
var method_type: MethodType = .get
//var header_type: MethodType = .get

class ServiceHelper: NSObject
{
    
    var tokenString = ""
    var tempPlanAmount = String()
    var tempEmail = String()
    var tempContact = String()
    
    class var sharedInstance: ServiceHelper
    {
        struct Static
        {
            static let instance: ServiceHelper = ServiceHelper()
        }
        return Static.instance
    }
    
    //MARK:- Public Functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
    func callAPIWithParameters(_ parameterDict:NSMutableDictionary, method:MethodType, apiName :String, hudType:loadingIndicatorType, completionBlock: @escaping (AnyObject?, NSError?, Bool?, Bool?) -> Void) ->Void
    {
        
        if (isReachable() == false)
        {
            completionBlock(nil,nil, false,nil)
            return
        }
        
        //>>>>>>>>>>> create post request
        let url = requestURL(method, apiName: apiName, parameterDict: parameterDict)
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = methodName(method)
        //request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let cookieHeader = (parameterDict.compactMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }) as Array).joined(separator: "&")
        
        print(cookieHeader)

        //>>>>>>>>>>>> insert json data to the request
        request.httpBody = cookieHeader.data(using: String.Encoding.utf8)
        request.timeoutInterval = timeoutInterval
        

        if UserDefaults.standard.object(forKey: "USERID") != nil
        {
            let authTokenString : String = UserDefaults.standard.string(forKey: "USERID")!
            logInfo("AuthTokenString:    \(authTokenString)")
            
            if authTokenString.count > 0
            {
                let longstring = authTokenString
                let data = (longstring).data(using: String.Encoding.utf8)
                _ = data!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
                request.setValue(authTokenString, forHTTPHeaderField: "userId")
            }
            else {
                DispatchQueue.main.async(execute:
                    {
                    // kAppDelegate.logOut()
                })
            }
        }

        logInfo("\n\n Request URL  >>>>>>\(url)")
        logInfo("\n\n Request Parameters >>>>>>\n\(parameterDict.toJsonString())")
        
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (
            data, response, error) in
            
            if error != nil
            {
                logInfo("\n\n error  >>>>>>\n\(error)")
                
                    completionBlock(nil,error as NSError?, true, true)
            }
            else
            {
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print(dataString!)
                
                _ = response as! HTTPURLResponse
              
                let responseString = NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue)
                logInfo("\nResponse String>>>> \n \(responseString)")
                
                do {

                    let result = try JSONSerialization.jsonObject(with: data!, options:  [.allowFragments, .mutableContainers])
                    DispatchQueue.main.async { [unowned self] in
                        completionBlock(result as AnyObject?,nil, true,true)
                    }

                } catch {
                    logInfo("\n\n error  >>>>>>\n\(error)")
                        completionBlock(nil,error as NSError?, true,true)
                }
            }
        }
        
        task.resume()
    }
    
    func callAPIWithNormalParameters(_ parameterDict:NSMutableDictionary, method:MethodType, apiName :String, hudType:loadingIndicatorType, completionBlock: @escaping (AnyObject?, NSError?, Bool?, Bool?) -> Void) ->Void
    {
        
        hud_type = hudType
        
        if (isReachable() == false)
        {
            completionBlock(nil,nil, false, nil)

            return
        }
        
        var url : URL!
        
        url = requestURL(method, apiName: apiName, parameterDict: parameterDict)
        
        //>>>>>>>>>>> create post request
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = methodName(method)
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        request.allHTTPHeaderFields = headers
        
        //>>>>>>>>>>>> insert json data to the request
        request.httpBody = body(method, parameterDict: parameterDict)
        request.timeoutInterval = timeoutInterval
        
        if method == .post
        {
            //request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type") //Content-Type
        }
        
        if UserDefaults.standard.object(forKey: "USERID") != nil
        {
            let authTokenString : String = UserDefaults.standard.string(forKey: "USERID")!
            logInfo("AuthTokenValue    \(authTokenString)")
            if authTokenString.count > 0
            {
 
                request.setValue(authTokenString, forHTTPHeaderField: "userId")
            }
            else
            {
                DispatchQueue.main.async(execute:
                    {
                    // kAppDelegate.logOut()
                })
            }
        }
        
        
        logInfo("\n\n Request URL  >>>>>>\(url)")
        logInfo("\n\n Request Parameters >>>>>>\n\(parameterDict.toJsonString())")
        
        hideAllHuds(false, type:hudType)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data,response,error in
            
            hideAllHuds(true, type:hudType )
            
            if error != nil
            {
                logInfo("\n\n error  >>>>>>\n\(String(describing: error))")
                completionBlock(nil,error as NSError?,true, true)
            }
            else
            {
                let httpResponse = response as! HTTPURLResponse
                let responseCode = httpResponse.statusCode
                
                _ = httpResponse.allHeaderFields as NSDictionary
                
                let responseString = NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue)
                logInfo("\n\n Response Code >>>>>> \n\(responseCode) <<<>>>\nResponse String>>>> \n \(responseString)")

                
                do {
                    let result = try JSONSerialization.jsonObject(with: data!, options:  [.allowFragments, .mutableContainers])
                    DispatchQueue.main.async { [unowned self] in
                        completionBlock(result as AnyObject?,nil,true,true)
                    }
                    
                } catch
                {
                    logInfo("\n\n error  >>>>>>\n\(error)")
                }
            }
        })
        
        task.resume()
    }
    
    func postFormDataServiceCall(url : String,param : Dictionary<String,Any>?,imageKey : String,imageData : Data,authToken : String,completionBlock : @escaping ( _ success : AnyObject?,_ error : Error?)-> Void)
    {
        
        let manager : AFHTTPSessionManager = AFHTTPSessionManager()
        manager.requestSerializer = AFJSONRequestSerializer()
        
        manager.post("\(ApiGet.baseURL)\(url)", parameters: param, constructingBodyWith: { (data : AFMultipartFormData) in
            
            //data.appendPart(withForm: , name: imageKey)
            data.appendPart(withFileData: imageData, name: imageKey, fileName: "id.png", mimeType: "image/png")
            
        }, progress: nil, success: { (task : URLSessionDataTask!, responseObject : Any!) in
            
            // Success block...
            completionBlock(responseObject as AnyObject?, nil)
            
            
        }) { (task : URLSessionDataTask?, error : Error?) in
            
            // Failure block...
            completionBlock(nil , error )
        }
    }

    //MARK:- Private Functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
    fileprivate func methodName(_ method:MethodType)-> String
    {
        switch method
        {
            case .get: return "GET"
            case .post: return "POST"
            case .delete: return "DELETE"
            case .put: return "PUT"
        }
    }
    
    fileprivate func body(_ method:MethodType, parameterDict:NSMutableDictionary) -> Data
    {
        switch method
        {
            case .get: return Data()
            case .post: return parameterDict.toNSData()
            
        default: return Data()
        }
    }
    
    fileprivate func requestURL(_ method:MethodType, apiName:String, parameterDict:NSMutableDictionary) -> URL {
        var urlString = ApiGet.baseURL + apiName
        
        switch method {
        case .get:
            return getURL(apiName, parameterDict: parameterDict)
            
        case .post:

            urlString = ApiGet.baseURL + apiName
        
        print("urlString")
        return URL(string: urlString)!
            
        default: return URL(string: urlString)!
        }
    }
    
    fileprivate func getURL(_ apiName:String, parameterDict:NSMutableDictionary) -> URL
    {
        var urlString = String()

        urlString = ApiGet.baseURL + apiName
            
        var isFirst = true
        for key in parameterDict.allKeys
        {
            
            let object = parameterDict[key as! String]
            print(object as Any)
            
            if object is NSArray
            {
                let array = object as! NSArray
                for eachObject in array
                {
                    var appendedStr = "&"
                    if (isFirst == true)
                    {
                        appendedStr = "?"
                    }
                    urlString += appendedStr + (key as! String) + "=" + (eachObject as! String)
                    isFirst = false
                }
                
            }
            else if object is NSMutableDictionary
            {

                

            }
            else
            {
                var appendedStr = "&"
                if (isFirst == true)
                {
                    appendedStr = "?"
                }
                let parameterStr = parameterDict[key as! String] as! String
                urlString += appendedStr + (key as! String) + "=" + parameterStr
            }
            
            isFirst = false
        }
        let strUrl = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return URL(string:strUrl!)!
    }
    
}


func isReachable() -> Bool
{
    let networkReachability = Reachability.forInternetConnection()
    let networkStatus = networkReachability?.currentReachabilityStatus()
    if networkStatus == NotReachable
    {
        return false
    }
    else
    {
        return true
    }
    
}

private func hideAllHuds(_ status:Bool, type:loadingIndicatorType)
{
    
    if (type == .smoothProgress)
    {
        return
    }
    

}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
extension NSDictionary
{
    func toNSData() -> Data
    {
        return try! JSONSerialization.data(withJSONObject: self, options: [])
    }
    
    func toJsonString() -> String
    {
        let jsonData = try! JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
        return jsonString
    }
}




