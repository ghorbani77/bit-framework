﻿

module Bit.Directives {

    @DirectiveDependency({
        name: "RadGridCancelButton",
        bindToController: {
        },
        controllerAs: "radGridCancelButton",
        restrict: "E",
        scope: true,
        template: ($element: JQuery, $attrs: ng.IAttributes & { ngClick: string }) => {
            delete $attrs.ngClick; // prevent $compiler from recompiling developer provided custom ng-click (if any)
            return `<button ng-click=";radGridCancelButton.radGrid.cancelDataItemChange($event)" ng-transclude></button>`;
        },
        replace: true,
        terminal: true,
        transclude: true
    })
    export class DefaultRadGridCancelButtonDirective {

        public static defaultClasses: string[] = ["md-button", "md-raised"];
        public radGrid: DefaultRadGridDirective;

        public constructor(@Inject("$element") public $element: JQuery) {

        }

        public $postLink() {

            setTimeout(() => {

                this.radGrid = this.$element.parents(".k-popup-edit-form").data("radGridController");

                DefaultRadGridAddButtonDirective.defaultClasses.forEach(cssClass => {
                    this.$element.addClass(cssClass);
                });

            }, 0);
        }

    }
}