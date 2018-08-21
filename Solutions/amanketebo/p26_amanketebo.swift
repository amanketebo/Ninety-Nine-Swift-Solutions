import NinetyNineSwiftProblems

extension List {
    func combinations(group: Int) -> List<List<T>>? {
        if group == 1 {
            var listOfLists: List<List<T>>!
            var lastListElement: List<List<T>>?
            var current: List? = self

            while let value = current?.value {
                let newList = List<List<T>>(List<T>(value))

                if listOfLists == nil {
                    listOfLists = newList
                } else {
                    lastListElement?.nextItem = newList
                }

                lastListElement = newList

                current = current?.nextItem
            }

            return listOfLists
        } else {
            var listOfLists: List<List<T>>?
            var listOfListsLastElement: List<List<T>>?
            var current: List? = self

            while let currentValue = current?.value {
                let rest = current?.remove(at: 0).0
                let restGrouped = rest?.combinations(group: group - 1)
                let listItem = List<T>(currentValue)
                var listItemLast = listItem

                var restGroupedCurrent: List<List<T>>? = restGrouped

                while let restGroupedCurrentValue = restGroupedCurrent?.value {
                    var innerCurrentListRestGroup: List<T>? = restGroupedCurrentValue

                    while let innerCurrentListRestGroupValue = innerCurrentListRestGroup?.value {
                        let newItem = List<T>(innerCurrentListRestGroupValue)

                        listItemLast.nextItem = newItem
                        listItemLast = newItem
                        innerCurrentListRestGroup = innerCurrentListRestGroup?.nextItem
                    }

                    let newCombo = List<List<T>>(listItem)

                    if listOfLists == nil {
                        listOfLists = newCombo
                    } else {
                        listOfListsLastElement?.nextItem = newCombo
                    }

                    listOfListsLastElement = newCombo

                    restGroupedCurrent = restGroupedCurrent?.nextItem
                }

                current = current?.nextItem
            }

            return listOfLists
        }
    }
}
