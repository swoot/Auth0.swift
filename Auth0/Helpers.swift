import Foundation

func date(from string: String) -> Date? {
    guard let interval = Double(string) else {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.date(from: string)
    }
    return Date(timeIntervalSince1970: interval)
}

func includeRequiredScope(in scope: String?) -> String? {
    guard let scope = scope, !scope.split(separator: " ").map(String.init).contains("openid") else { return scope }
    return "openid \(scope)"
}

/**
 returns the redirect uri for this app
 */
func redirectUri(url: URL) -> URL? {
    // return if can't get the bundle identifier
    guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
        return nil
    }
    
    // create the url components with the provided url
    guard
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true),
        components.url != nil else {
        return nil
    }
    
    // set the bundle identifier as the scheme
    components.scheme = bundleIdentifier
    
    // make sure we have the url from the components
    guard let componentUrl = components.url else {
        return nil
    }
    
    // get the correct platform
#if os(macOS)
    let platform = "macos"
#else
    let platform = "ios"
#endif
    
    // return the whole thing
    return componentUrl
        .appendingPathComponent(platform)
        .appendingPathComponent(bundleIdentifier)
        .appendingPathComponent("callback")
}
