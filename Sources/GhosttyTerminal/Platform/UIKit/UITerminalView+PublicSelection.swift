//
//  UITerminalView+PublicSelection.swift
//  libghostty-spm
//
//  Where Ghostty's own selection lies — the pointer selection on Mac
//  Catalyst and iPad. The inline touch selection is a separate overlay
//  (`TouchSelectionState`) and is not reported here.
//

#if canImport(UIKit)
    import UIKit

    public extension UITerminalView {
        /// Where the selection lies on screen, nil when there is none or
        /// none of it is in view. See ``TerminalSurface/selectionRegion()``.
        var selectionRegion: TerminalSelectionRegion? {
            surface?.selectionRegion()
        }

        /// Whether the inline touch selection is up. A host that adds its own
        /// one-finger gestures holds them back meanwhile, since a one-finger
        /// drag then extends the selection.
        var hasTouchSelection: Bool {
            touchSelection.range != nil
        }

        /// The viewport cell under `point`, in this view's coordinates.
        func viewportCell(at point: CGPoint) -> TerminalViewportCell? {
            surface?.viewportCell(at: point, scale: resolvedDisplayScale())
        }

        /// Whether the cell under `point` (this view's coordinates) is
        /// selected.
        func selectionContains(_ point: CGPoint) -> Bool {
            surface?.selectionContains(point, scale: resolvedDisplayScale()) ?? false
        }
    }
#endif
