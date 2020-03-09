//  Copyright © 2020 Oliver Jones. All rights reserved.
//

import Foundation

func fibonacci(_ n: Int) -> Int {
    guard n > 1 else {
        return (n == 0 ? 0 : 1)
    }

    return fibonacci(n-1) + fibonacci(n-2)
}
