import Foundation

/// UserDaultsを使いやすいための便利クラス
public class UserDefaultObject <T :Any> {
    
    /// 保存されたデータのキー
    private let key : String
    
    /// 保存されたデータのデフォルト値
    let  defaultObject : T
    
    /// コンストラクタメソッド
    ///
    /// - Parameters:
    ///   - key: 保存されたデータのキー
    ///   - defaultObject: 保存されたデータのデフォルト値
    init(key : String , defaultObject : T) {
        self.key = key
        self.defaultObject = defaultObject
    }
    
    /// 今保存されたデータを取る
    ///
    /// - Returns: そのダータが設定されたの上に、タイプも同じの場合は、タイプを変更した後に返す。他の場合は、デフォルト値を返す。
    func get() -> T {
        return UserDefaults.standard.value(forKey: key) as? T ?? defaultObject
    }
    
    /// データを設定する
    ///
    /// - Parameter value: 設定したいの目標値
    func set( value : T ) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    /// 保持されたデータをデフォルト値に戻る
    func reset() {
        set(value: defaultObject)
    }
    
    /// 保存されたデータを削除する
    func remove(){
        UserDefaults.standard.removeObject(forKey: key)
    }
}
