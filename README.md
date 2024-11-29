# Character Apps

A Swift workspace with apps that display characters and their details from the *Rick and Morty API* with status filtering capabilities.

I've explored various UI approaches to implement the task and aim to deliver a standout solution that outperforms the competition.

---

## The Apps

- **🚀 MixedUICharacterApp** (main app)
- **🖼 UIKitCharacterApp**
- **📱 SwiftUICharacterApp**

---

# Common Features

- **🧹 Super clean** code based on Design Patterns and SOLID Principles 
- Adapted **📐 OOP**, **🔄 POP**, and **📏 Inheritance** concepts
- **🔌 Decoupled** and **✅ Testable** Code
- Corporate Reactive Programming using **💥 Combine**
- Decoupled and Testable **🌐 Network Layer** based on **URLSession**
- Integrated **🔑 Higher-Order Functions** (e.g., `map`, `compactMap`)
- Implemented reusable functions through **🔧 extensions**
- No **🎩 magic** or **❌ hardcoded strings** in the code files
- Limited use of third-party libraries (**🖼 Kingfisher**, **📦 SnapKit**)

---

## Implementation Details

In this section, I will explain each app and its key features in depth.

---

### 🚀 **MixedUICharacterApp**

This app follows the submission guidelines and is primarily built with **SwiftUI**, while integrating **UICollectionView**.

#### Common Features
- Built using **🏗️ MVVM** Architecture
- A base **🔲 View** and **📦 ViewModel** are implemented
- Custom, reusable views like **🛠️ StatusView** and **🔲 RoundedStyle** are introduced
- **🎨 UICollectionView** was integrated using the `UIViewRepresentable` protocol
- The **🔒 API Service** was mocked in two different ways
- **🧪 Unit Tests** and **🔬 UI Test Cases** have been implemented
- The test coverage is above **85%** 🎯

---

### 🖼 **UIKitCharacterApp**

This app is developed entirely with **UIKit** to showcase proficiency in Swift and UIKit.

#### Common Features
- Developed using **🏗️ MVVM-C** Architecture
- **🎬 View Controllers** and custom views were built programmatically
- Navigation is handled using the **🧭 Coordinator** pattern
- **🛠️ Clean & Complex** views are created using **📐 Auto Layout** with no warnings
- A base **🔲 View** and **📦 ViewModel** are implemented
- Custom reusable views like **📊 UIFiltersView** and **📄 UIDetailsView** were introduced
- A few third-party libraries were used (**🖼 Kingfisher**, **📦 SnapKit**)

---

### 📱 **SwiftUICharacterApp**

This app is developed entirely with **SwiftUI** to demonstrate proficiency in Swift and SwiftUI.

#### Common Features
- Built using **🏗️ MVVM** Architecture
- Implemented a new **🎨 design** for the interface
- Introduced custom, reusable views like **📝 TinyInfoItemView**

---

## Prerequisites

- **💻 Xcode 15.4** (15F31d)
- **⚙️ Swift 5.9**
