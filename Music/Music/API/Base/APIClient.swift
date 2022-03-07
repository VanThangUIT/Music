//
//  APIClient.swift
//  Music
//
//  Created by Nguyen Van Thang on 07/03/2022.
//

import Foundation
import Alamofire
import RxSwift

class APIClient {
    static let shared = APIClient()
    
    private init() {}
    
    func fetchTokenAccessId(params: FetchTokenParam) -> Observable<TokenResponse> {
        return request(APIRouter.fetchToken(params: params))
    }
   
    //func fetchTemplateImage(baseUrl: String, path: String, params: FetchTemplateImageParams) -> Observable<
    /*-------------------------------------------------------------------------------------------------*/
    // MARK: - The request function to get results in an Observable
    private func request<T: Decodable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        //handle internet connection here
        if !Connectivity.isConnectedToInternet() {
            //showAlertWhenNoInternetConnection()
            return Observable<T>.create { observer in
                observer.onCompleted()
                return Disposables.create {
                    print("No Internet Connection")
                }
            }
        }
        
        //Create an RxSwift observable, which will be the one to call the request when subscribed to
        return Observable<T>.create { observer in
            //Trigger the HttpRequest using AlamoFire (AF)
            let request = AF.request(urlConvertible).validate().responseDecodable { (response: AFDataResponse<T>) in
                //Check the result from Alamofire's response and check if it's a success or a failure
                //print(response.result)
                switch response.result {
                case .success(let value):
                    //Everything is fine, return the value in onNext
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    //Something went wrong, switch on the status code and return the error
                    switch response.response?.statusCode {
                    case 204:
                        observer.onError(ApiError.deleteSuccess)
                    case 400:
                        observer.onError(ApiError.notFound)
                    case 401:
                        //self.forceBackToSignUpScreen()
                        observer.onError(ApiError.unAuthorized)
                    case 403:
                        observer.onError(ApiError.forbidden)
                    case 404:
                        observer.onError(ApiError.notFound)
                    case 409:
                        observer.onError(ApiError.conflict)
                    case 413:
                        observer.onError(ApiError.requestEntityTooLarge)
                    case 422:
                        observer.onError(ApiError.alreadyTaken)
                    case 500:
                        observer.onError(ApiError.internalServerError)
                    default:
                        observer.onError(error)
                    }
                }
            }
            
            //Finally, we return a disposable to stop the request
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
